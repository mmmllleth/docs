https://dev.to/yosi/deploy-a-smart-contract-with-ethersjs-28no

```
const ethers = require('ethers');
const fs = require('fs');
(async () => {
  // Deploy the contract to Ethereum test network - Ropsten
  const provider = ethers.providers.getDefaultProvider('ropsten')

  // Use your wallet's private key to deploy the contract
  const privateKey = 'YOUT_PRIVATE_KEY'
  const wallet = new ethers.Wallet(privateKey, provider)

  // Read the contract artifact, which was generated by Remix
  const metadata = JSON.parse(fs.readFileSync('contract.json').toString())

  // Set gas limit and gas price, using the default Ropsten provider
  const price = ethers.utils.formatUnits(await provider.getGasPrice(), 'gwei')
  const options = {gasLimit: 100000, gasPrice: ethers.utils.parseUnits(price, 'gwei')}

  // Deploy the contract
  const factory = new ethers.ContractFactory(metadata.abi, metadata.data.bytecode.object, wallet)
  const contract = await factory.deploy(options)
  await contract.deployed()
  console.log(`Deployment successful! Contract Address: ${contract.address}`)
})()
```
