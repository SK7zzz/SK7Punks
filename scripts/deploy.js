const deploy = async () => {
    const [deployer] = await ethers.getSigners();

    console.log("Deploying contract with the account:", deployer.address);

    const SK7Punks = await ethers.getContractFactory("SK7Punks");
    const deployed = await SK7Punks.deploy();

    console.log("SK7Punks is deployed at:", deployed.address);
}

deploy()
.then(() => process.exit(0))
.catch(error => {
    console.log(error);
    process.exit(1);
});