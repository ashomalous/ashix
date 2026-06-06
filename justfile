default:
    @just --list

# create a new bootable generation and switch into it
switch: 
    nixos apply

# test a generation without creating a bootable generation for it
test: 
    nixos apply --no-boot

# create a new bootable generation, but don't switch into it.
boot:
    nixos apply --no-activate

# list existing nixos generations
list:
    nixos generation list

# rollback to the previous generation
rollback:
    nixos generation rollback

# delete older generations, keeping exactly `COUNT` generations around
[arg("verbose", long="verbose", short="v", value="--verbose")]
clean count="5" verbose="":
    nixos generation delete --min {{count}} --all {{verbose}}
