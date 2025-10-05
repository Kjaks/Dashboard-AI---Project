<template>
  <v-app-bar :elevation="2" color="#1E3A8A">
    <v-app-bar-nav-icon @click="$emit('toggle-drawer')"></v-app-bar-nav-icon>
    <v-app-bar-title>Almería Distribuciones</v-app-bar-title>
    
    <template v-slot:append>
      <v-btn icon="mdi-heart"></v-btn>

      <v-btn icon="mdi-magnify"></v-btn>

      <v-btn icon="mdi-dots-vertical"></v-btn>
    </template>
  </v-app-bar>
</template>

<script lang="ts">
export default {
  emits: ['toggle-drawer']
}
</script>
