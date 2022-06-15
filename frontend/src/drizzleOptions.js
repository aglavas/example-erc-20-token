import ERC20TOKEN from '../../build/contracts/ERC20Token'

const options = {
  web3: {
    block: false,
    fallback: {
      type: 'ws',
      url: 'ws://127.0.0.1:7545'
    }
  },
  contracts: [ERC20TOKEN],
  polls: {
    accounts: 15000
  }
}

export default options