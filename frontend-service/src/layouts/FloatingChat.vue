<template>
  <div class="floating-chat-wrapper">
    <!-- Botón flotante -->
     <div :class="{'chat-open': openChat}">
      <v-btn
        color="#3A76A9"
        dark
        fab
        height="4rem"
        rounded
        @click="openChat = !openChat"
        class="floating-btn"
        @mouseenter="hover = true"
        @mouseleave="hover = false"
      >
        <v-icon>mdi-robot</v-icon>
      </v-btn>
     </div>

    <!-- Burbuja de mensaje que se desliza -->
    <transition :name="openChat ? '' : 'slide-right'">
      <div 
      v-if="(showTip || hover) && !openChat" 
      class="chat-tip">
        🤖 ¡Hey! ¿Necesitas ayuda?
      </div>
    </transition>

    <!-- Chat completo -->
    <transition name="slide-up">
      <div v-if="openChat" class="chat-floating">
        <div class="chat-log" style="height: 10rem;">
          <div v-for="(m,i) in log" :key="i">
            <strong>{{ m.user }}:</strong> {{ m.text }}
          </div>
        </div>
        <v-textarea v-model="message" label="Escribe tu consulta" outlined dense rows="1"></v-textarea>
        <v-btn color="#1F4E79" class="mt-1" @click="sendMessage">Enviar</v-btn>
      </div>
    </transition>
  </div>
</template>

<script lang="ts">
import { ref, onMounted, watch } from 'vue'
import axios from 'axios'

export default {
  setup() {
    const openChat = ref(false)
    const showTip = ref(false)
    const hover = ref(false)
    const message = ref('')
    const log = ref<{user:string,text:string}[]>([])

    onMounted(() => {
      setTimeout(() => showTip.value = true, 1500)
      setTimeout(() => showTip.value = false, 10000)
    })

    watch(hover, (newVal) => {
      if(newVal) showTip.value = false
    })

    const sendMessage = async () => {
      if (!message.value) return

      log.value.push({ user: 'Tú', text: message.value })

      try {
        log.value.push({ user: 'Bot 🤖', text: 'Bip bop… procesando tus datos!' })

        const response = await axios.post('http://localhost:8000/deepseek/chat', {
          message: message.value
        }, {
          headers: {
            'Content-Type': 'application/json'
          }
        })

        log.value.pop()
        log.value.push({ user: 'Bot 🤖', text: response.data?.response || 'No hubo respuesta.' })
      } catch (error: any) {
        log.value.pop()
        log.value.push({ user: 'Bot 🤖', text: `Error: ${error.response?.data?.detail || error.message}` })
      } finally {
        message.value = ''
      }
    }

    return { openChat, showTip, hover, message, log, sendMessage }
  }
}
</script>

<style scoped>
.floating-chat-wrapper {
  display: flex;
  flex-direction: row-reverse;
  align-items: center;
  width: 300px;
}

.floating-btn {
  z-index: 2;
}

.chat-open {
  margin: 0 auto;
}

.chat-tip {
  margin-right: -1rem;
  background-color: white;
  color: #111827;
  border-top-left-radius: 12px;
  border-bottom-left-radius: 12px;
  padding: 1rem 2rem 1rem 1rem;
  align-content: center;
  height: 4rem;
  box-shadow: 0 4px 12px rgba(0,0,0,0.15);
  text-align: left;
  z-index: 1;
}

/* Chat flotante */
.chat-floating {
  position: absolute;
  bottom: 60px;
  right: 0;
  width: 300px;
  background-color: white;
  border-radius: 12px;
  box-shadow: 0 6px 18px rgba(0,0,0,0.2);
  padding: 1rem;
  z-index: 2;
}

.chat-header {
  font-weight: bold;
  margin-bottom: 0.5rem;
}

.chat-log {
  max-height: 200px;
  overflow-y: auto;
  margin-bottom: 0.5rem;
}

/* Animaciones */
.slide-up-enter-active,
.slide-up-leave-active {
  transition: all 0.3s ease;
}
.slide-up-enter-from {
  opacity: 0;
  transform: translateY(20px);
}
.slide-up-enter-to {
  opacity: 1;
  transform: translateY(0);
}
.slide-up-leave-from {
  opacity: 1;
  transform: translateY(0);
}
.slide-up-leave-to {
  opacity: 0;
  transform: translateY(20px);
}

.slide-right-enter-active,
.slide-right-leave-active {
  transition: all 1.5s ease;
}

.slide-right-enter-from {
  opacity: 0;
  transform: translateX(10px);
}

.slide-right-enter-to {
  opacity: 1;
  transform: translateX(0);
}

.slide-right-leave-from {
  opacity: 1;
  transform: translateX(0);
}

.slide-right-leave-to {
  opacity: 0;
  transform: translateX(20px);
}

</style>
