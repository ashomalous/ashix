default:
    @just --list

apply *flags:
    nixos apply . {{flags}}

# create a new bootable generation and switch into it
switch: (apply)

# test a generation without creating a bootable generation for it
test: (apply "--no-boot") 

# create a new bootable generation, but don't switch into it.
boot: (apply "--no-activate")

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
