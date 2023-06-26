// app.js

window.addEventListener('DOMContentLoaded', async () => {
    const provider = await ethers.getDefaultProvider();
    const signer = provider.getSigner();
    let orgRegistryContract;
    let tokenVestingContract;

    // Connect Wallet Button
    const connectWalletBtn = document.getElementById('connect-wallet-btn');
    const walletAddress = document.getElementById('wallet-address');

    connectWalletBtn.addEventListener('click', async () => {
        const accounts = await ethereum.request({ method: 'eth_requestAccounts' });
        const address = accounts[0];
        walletAddress.textContent = `Connected Wallet Address: ${address}`;

        orgRegistryContract = new ethers.Contract(OrgRegistryContractAddress, OrgRegistryContractABI, signer);
        tokenVestingContract = new ethers.Contract(TokenVestingContractAddress, TokenVestingContractABI, signer);

        // Show appropriate sections based on wallet connection
        document.getElementById('admin-section').style.display = 'block';
        document.getElementById('user-section').style.display = '
