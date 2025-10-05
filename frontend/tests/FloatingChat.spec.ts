// tests/FloatingChat.spec.ts
import { mount } from '@vue/test-utils'
import { createVuetify } from 'vuetify'
import * as components from 'vuetify/components'
import * as directives from 'vuetify/directives'
import FloatingChat from '../src/layouts/FloatingChat.vue'
import { nextTick } from 'vue'

// Create Vuetify instance
const vuetify = createVuetify({ components, directives })

describe('FloatingChat.vue', () => {
  it('renders the button', () => {
    const wrapper = mount(FloatingChat, {
      global: {
        plugins: [vuetify],
      },
    })
    expect(wrapper.find('button').exists()).toBe(true)
  })

  it('shows the chat bubble on hover', async () => {
    const wrapper = mount(FloatingChat, {
      global: {
        plugins: [vuetify],
      },
    })
    const btn = wrapper.find('button')
    await btn.trigger('mouseenter')
    await nextTick()
    expect(wrapper.find('.chat-tip').exists()).toBe(true)
  })

  it('opens the chat when clicked', async () => {
    const wrapper = mount(FloatingChat, {
      global: {
        plugins: [vuetify],
      },
    })
    const btn = wrapper.find('button')
    await btn.trigger('click')
    await nextTick()
    expect(wrapper.find('.chat-floating').exists()).toBe(true)
    expect(wrapper.find('.chat-tip').exists()).toBe(false)
  })
})
