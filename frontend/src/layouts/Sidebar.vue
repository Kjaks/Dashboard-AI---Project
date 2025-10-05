<template>
  <v-navigation-drawer v-model="drawer" app temporary color="#111827" dark>
    <v-list>
      <v-list-item
        prepend-avatar="https://randomuser.me/api/portraits/women/85.jpg"
        subtitle="sandra_a88@gmailcom"
        title="Sandra Adams"
      ></v-list-item>
    </v-list>

    <v-divider></v-divider>

    <v-list nav dense>
      <v-list-item link title="Dashboard" prepend-icon="mdi-view-dashboard" />
      <v-list-item link title="Clientes" prepend-icon="mdi-account-group" />
      <v-list-item link title="Ventas" prepend-icon="mdi-cart" />
      <v-list-item link title="Chat" prepend-icon="mdi-robot" />
      <v-list-item link title="Reportes" prepend-icon="mdi-chart-line" />
    </v-list>
  </v-navigation-drawer>
</template>

<script lang="ts">
export default {
  props: { modelValue: Boolean },
  emits: ['update:modelValue'],
  computed: {
    drawer: {
      get() { return this.modelValue },
      set(val: boolean) { this.$emit('update:modelValue', val) }
    }
  }
}
</script>
