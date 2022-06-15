<template>
  <div v-if="isDrizzleInitialized" id="app">
    <img alt="Vue logo" src="./assets/logo.png" />
    <drizzle-account />
    <TokenMetadata></TokenMetadata>
    <TokenWallet></TokenWallet>
  </div>
  <div v-else>Loading...</div>
</template>

<script>
import { mapGetters } from 'vuex';
import TokenMetadata from './components/TokenMetadata.vue';
import TokenWallet from './components/TokenWallet.vue';

export default {
  name: 'App',
  components: {
    TokenMetadata,
    TokenWallet
  },
  computed: mapGetters('drizzle', ['isDrizzleInitialized'])
}
</script>