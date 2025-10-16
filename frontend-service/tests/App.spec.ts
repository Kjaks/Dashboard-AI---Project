import { mount } from '@vue/test-utils'
import App from '../src/app/App.vue'
import Header from '../src/layouts/Header.vue'
import Sidebar from '../src/layouts/Sidebar.vue'
import FloatingChat from '../src/layouts/FloatingChat.vue'
import { describe, expect, it } from 'vitest'

describe('App.vue', () => {
  it('renders Header, Sidebar, and FloatingChat', () => {
    const wrapper = mount(App)
    expect(wrapper.findComponent(Header).exists()).toBe(true)
    expect(wrapper.findComponent(Sidebar).exists()).toBe(true)
    expect(wrapper.findComponent(FloatingChat).exists()).toBe(true)
  })

  it('toggles drawer when Header emits toggle-drawer', async () => {
    const wrapper = mount(App)
    const header = wrapper.findComponent(Header)

    await header.vm.$emit('toggle-drawer')
    expect(wrapper.vm.drawer).toBe(true)
  })
})
