var web3;

async function Connect(){
    await window.web3.currentProvider.enable();
    web3 = new Web3(window.web3.currentProvider)
}


const getWeb3 =  async () => {
    return new Promise(async(resolve, reject) =>{
        const web3 = new Web3(window.ethereum)
        try{
            await window.ethereum.request({method:"eth_requestAccounts"})
        }catch(error){
            reject(error)
        }
    }

    )
}



// const User=require('./cert-schema')
// const { createHash } = require('crypto');

//  function hash(string) {
//   return createHash('sha256').update(string).digest('hex');
// }
// console.log(hash("hello"))