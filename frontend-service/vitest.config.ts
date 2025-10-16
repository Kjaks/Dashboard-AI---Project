/// <reference types="vitest" />
import { defineConfig } from 'vitest/config'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  plugins: [vue()],
  test: {
    globals: true,
    environment: 'jsdom',
    setupFiles: ['./vitest.setup.ts', './tests/setup.ts'],
    css: false,
    pool: "vmThreads",
    coverage: {
      reporter: ['text', 'html'],
      exclude: ['node_modules/', 'tests/'],
      thresholds: {
        lines: 80,
        functions: 80,
        branches: 70,
        statements: 80
      }
    }
  },
})
