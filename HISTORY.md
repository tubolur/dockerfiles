# VERSION HISTORY

## cheatsheet
<details>
   <summary> <h2><b> 0.1.0 </b></h2> </summary>  
   
- [x] first version
- [ ] include podman information

</details>

## httpsserver 
<details>
   <summary> <h2><b> 0.1.2 </b></h2> </summary>
   
- [x] first version
- [x] retrieve key and cert files from host directory
- [ ] improve image size (currently around 1.2 Gb)
- [ ] dispatch Dockerfile in smaller layers

</details>

## arch_repo 
<details>
   <summary> <h2><b> 0.1.4 </b></h2> </summary>
   
- [x] first version
- [x] retrieve key and cert files from host directory
- [x] make the host folder containing key/repo data accessible to the container image build **fixed by copying files into the same dir as Dockerfile**
- [x] added unzip package for convenience
- [x] added variable PACKAGE_ZIP_URL & PACKAGE_ZIP to enable retrieving packages from a remote zip file
- [ ] fix HTTPS Server only sharing **public/** folder
- [ ] improve image size (currently around 1.2 Gb)
- [ ] dispatch Dockerfile in smaller layers

</details>
