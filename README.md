# Getting Started 🚀

## About 
A project to create and deploy a standard ERC20 token using Foundry and OpenZeppelin.
## Requirements
[git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git): 
Ensure Git is installed. Verify by running ```git --version```. If you see something like ```git version x.x.x```, you're all set.


[foundry](https://getfoundry.sh/):
Ensure Foundry is installed. Check with ```forge --version```. If you see a version string like ```forge 0.2.0 (f2518c9 2024-08-06T00:18:13.943817879Z)```, you're good to go.

## Usage
### OpenZeppelin-Contracts
### Explore the Docs 
Dive into the [OpenZeppelin Contracts Documentation](https://docs.openzeppelin.com/contracts/4.x/) for detailed guidance and examples.
### Get Involved
Check out the [OpenZeppelin GitHub Repository](https://github.com/OpenZeppelin/openzeppelin-contracts) to see the code and contribute to the community.
### Installation OpenZeppelin package
To get started with OpenZeppelin Contracts, install the package
```
forge install OpenZeppelin/openzeppelin-contracts
```

### Spin Up a Local Node
Start your local blockchain node to deploy contracts:
```
make anvil
```

### Deploy
With your local node up and running, deploy your contracts with:
```
make deploy
```

### Deployment to testnet or mainnet
1. Setup Environment Variables 

You'll need to configure your environment with `$SEPOLIA_RPC_URL` and `PRIVATE_KEY` in a `.env` file:

- `$PRIVATE_KEY`: Your account's private key (e.g., from [Metamask](https://metamask.io/)). **SERIOUS NOTE:** For development, use a key without real funds.

- `$SEPOLIA_RPC_URL`: URL of the Sepolia testnet node you're using. You can get this from any free service provider like [Alchemy](https://www.alchemy.com/).

- **Optionally:** Add `ETHERSCAN_API_KEY` if you want to verify your contract on [Etherscan](https://etherscan.io/).

2. Get testnet ETH 
 
Go to [faucets.chain.link](https://faucets.chain.link/) or any other faucet to get testnet ETH, you should see ETH appear in you wallet.

3. Deploy

You can deploy to testnet Sepolia or any other network.
```
make deploy-sepolia
```

## Scripts
After deploy to a testnet or local net, you can run the scripts.

Using cast deployed locally example:
```
cast send <ERC20_CONTRACT_ADDRESS> "transfer()"  --value 0.1ether --private-key <PRIVATE_KEY> --rpc-url $SEPOLIA_RPC_URL
```


### Testing

This project consists of basic unit testing to ensure its functionality.

```
forge test
```
You can also,
```
// Only run test functions matching the specified regex pattern.

forge test --match-test testFunctionName
```

or
```
forge test --fork-url $SEPOLIA_RPC_URL
```

### Test Coverage
```
forge coverage
```

## Gas Estimation
You can estimate how much gas different things cost by running
```
forge snapshot
```
You'll see any output file called `.gas-snapshot`

## Additional Note ⚠️

Best practice to use your `$PRIVATE_KEY` is to encode it and then use it, you should never hard copy paste your private key with the real funds in the `.env` file.

## Thanks 🙌
Thank you for staying engaged with this project, ff you appreciated this, feel free to follow!

