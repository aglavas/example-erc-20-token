<template>
  <div class="section">
    <h2>ERC20 Token</h2>
    <drizzle-contract contractName="ERC20Token" method="name" label="Name"/>
    <drizzle-contract contractName="ERC20Token" method="symbol" label="Symbol"/>
    <drizzle-contract contractName="ERC20Token" method="decimals" label="Decimals"/>
    <drizzle-contract contractName="ERC20Token" method="balanceOf" label="Balance" :methodArgs="[activeAccount]"/>
  </div>
</template>
<script>
import { mapGetters } from 'vuex';
export default {
  name: 'TokenMetadata',
  computed: mapGetters('accounts', ['activeAccount'])
}
</script>