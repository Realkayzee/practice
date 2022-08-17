require("dotenv").config({path: ".env"});
import "@nomiclabs/hardhat-ethers";



const GOERLI_API_URL = process.env.ALCHEMY_GOERLI_API_URL;

const PRIVATE = process.env.PRIVATE_KEY;

const MAINNET_API_URL = process.env.ALCHEMY_MAINNET_API_URL;


module.exports = {
  solidity: "0.8.9",
  networks: {
    hardhat: {
      forking: {
        url: MAINNET_API_URL,
      }
    },
    goerli: {
      url: GOERLI_API_URL,
      accounts: [PRIVATE],
    }
  }
}
