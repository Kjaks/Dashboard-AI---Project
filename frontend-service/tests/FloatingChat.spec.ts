// tests/FloatingChat.spec.ts
import { mount, VueWrapper } from '@vue/test-utils'
import FloatingChat from '../src/layouts/FloatingChat.vue'
import { nextTick } from 'vue'
import { afterEach, beforeEach, describe, expect, it } from 'vitest'

describe('FloatingChat.vue', () => {
  let wrapper: VueWrapper<InstanceType<typeof FloatingChat>>

  beforeEach(() => {
    wrapper = mount(FloatingChat) as VueWrapper<InstanceType<typeof FloatingChat>>
  })

  afterEach(() => {
    wrapper.unmount()
  })

  it('renders the button', () => {
    const btn = wrapper.find('button')
    expect(btn.exists()).toBe(true)
  })

  it('shows the chat bubble on hover', async () => {
    const btn = wrapper.find('button')
    await btn.trigger('mouseenter')
    await nextTick()
    expect(wrapper.find('.chat-tip').exists()).toBe(true)
  })

  it('opens the chat when clicked', async () => {
    const btn = wrapper.find('button')
    await btn.trigger('click')
    await nextTick()
    expect(wrapper.find('.chat-floating').exists()).toBe(true)
    expect(wrapper.find('.chat-tip').exists()).toBe(false)
  })
})
