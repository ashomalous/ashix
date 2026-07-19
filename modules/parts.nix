{ den, ... }:
{
  den.default.includes = with den.batteries; [
    inputs'
    self'
  ];
}
