// tests/setup.ts
import { config } from '@vue/test-utils'
import { createVuetify } from 'vuetify'
import * as components from 'vuetify/components'
import * as directives from 'vuetify/directives'

class MockResizeObserver {
  observe() {}
  unobserve() {}
  disconnect() {}
}
;(globalThis as any).ResizeObserver = MockResizeObserver

const vuetify = createVuetify({
  components,
  directives,
})

config.global.plugins = [vuetify]

config.global.stubs = {
  'router-view': true,
  transition: false,
}
