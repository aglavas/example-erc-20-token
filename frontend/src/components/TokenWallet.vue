<template>
  <div>
    <div class="form-group">
      <h2>Transfer</h2>
      <drizzle-contract-form contractName="ERC20Token" method="transfer" />
    </div>
    <div class="form-group">
      <h2>Transfer From</h2>
      <drizzle-contract-form contractName="ERC20Token" method="transferFrom" />
    </div>
    <div class="form-group">
      <h2>Approve</h2>
      <drizzle-contract-form contractName="ERC20Token" method="approve" />
    </div>
  </div>
</template>

<script>
export default {
  name: 'TokenWallet'
}
</script>