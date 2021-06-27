# install-grid-oracle-single-19
Repository to deploy Oracle Grid Infrastructure and Oracle RDBMS Single Instance running on 19c version

I know there is many automatic task you can do with preinstall package, but the ideia here is to have fun and install your own customized Oracle environment, with most automatic tasks as possible.

## Usage

## Preparing the Operating System

- [ ] Install Missing Packages
- [ ] Create Users, Groups and Directories
- [ ] Customize the Kernel
- [ ] Install Grid Home
- [ ] Create Oracle ASM Disks
- [ ] Configure HAS Stack

## Install Missing Packages
```sh
./install_missing_packages.sh
```

- [x] Install Missing Packages

## Create Users, Groups and Directories

```sh
./create_users.sh
```
```sh
./create_directories.sh
```

- [x] Create Users, Groups and Directories

## Customize the Kernel

```sh
./customize_kernel.sh
```

- [x] Customize the Kernel 

## Extract Oracle binaries

```sh
./create_grid_response_files.sh
```

```sh
./install_grid.sh
```

- [x] Install Grid Home