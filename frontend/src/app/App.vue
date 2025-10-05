<template>
  <v-app>
    <Header @toggle-drawer="drawer = !drawer" />

    <Sidebar v-model="drawer" />

    <v-main>
      <v-container fluid class="content-container">
        <router-view />
      </v-container>
    </v-main>

    <div class="floating-chat-wrapper">
      <FloatingChat />
    </div>
  </v-app>
</template>

<script lang="ts">
import { ref } from 'vue'
import Header from '../layouts/Header.vue';
import Sidebar from '../layouts/Sidebar.vue';
import FloatingChat from '../layouts/FloatingChat.vue';

export default {
  components: { Header, Sidebar, FloatingChat },
  setup() {
    const drawer = ref(false)
    return { drawer }
  }
};
</script>

<style scoped>
v-main {
  background-color: #F3F4F6;
}

.floating-chat-wrapper {
  position: fixed;
  bottom: 2rem;
  right: 2rem;
}

.content-container {
  padding: 2rem;
}

router-view > * {
  background-color: #FFFFFF;
  border-radius: 8px;
  box-shadow: 0 2px 6px rgba(0,0,0,0.1);
  padding: 16px;
}

body {
  color: #111827;
}

h2, h3, h4, h5, h6 {
  color: #6B7280;
}
</style>
