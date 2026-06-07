{ inputs, ... }:
{
  imports = [ inputs.flake-aspects.flakeModule ];

  systems = import inputs.systems;
}
