let
  keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILLmqONTBP40x0Zfwge/PmIBJvPufkdvTiykC8UG6uOJ root@newo"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOUsvvWE0eKNWBhQ8l+5W5nuKteunAE7pAu87NMBIhgz newo@newo"
  ];
in {
  # create/edit: nix run github:ryantm/agenix -- -e x.age
  # rekey:       nix run github:ryantm/agenix -- -r
  "password.age".publicKeys = keys;
}
