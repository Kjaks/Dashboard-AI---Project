import { createRouter, createWebHistory } from 'vue-router'
import Home from '../features/home/Home.vue'

const routes = [
  { path: '/', component: Home }
]

export const router = createRouter({
  history: createWebHistory(),
  routes,
})