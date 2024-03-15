---
layout: intro
class: text-left
title: Reproducibility
defaults:
    style: 'background-image: linear-gradient(rgba(0, 0, 0, 0.333), rgba(0, 0, 0, 0.533)), url("/bg.svg"); background-repeat: no-repeat; background-position: center center; background-size: cover; --slidev-code-background: #1e1e2e;'
    layout: center
---

## Reproducibility

-- Isabel --

<!--
Introduce myself

I think one of the biggest issues we ever get told is _swap slide_
-->

---

![it_works_on_my_machine](/it_works_on_my_machine.png)

<!-- but i refuse to believe that this is the only possible answer, so I looked onwards. asking myself _swap slides_ -->

---

## So what's the solution?

<!-- well most people might try to push you towards containerisation -->

---

![docker](/docker.png)

<!-- and if you did give in you will find this pretty looking guy. And I did try that myself at one point _swap slides_ -->

---

![my_docker_image](/docker_image.png)

<!-- So I gave it a shot, I containerised my website, which you can still find on docker hub to this day, but it still was not a flawless out come _swap slides_ -->

---

![devops](/devops.png)

<!-- there was still a chance of hitting some kind of obscure error, this picture pretty much sums it, But that lead me to asking the question once again _swap slides_ -->

---

## So what's the solution?

<!-- 
    if you have been paying a lot of attention you might've noticed the background image (which I made), is the nix logo.
-->

---

## Nix

<!-- 
    Nix and thus NixOS, a fully declarative and reproducible environment

    But now you might ask,
-->

---

## So what did this actually change?

<br>

<v-clicks fade-out class="text-left">

- My neovim config
- My website
- My system configurations (even my Mac)

</v-clicks>

<!-- these are all examples of things that I was now able to make completely reproducible and build declaratively. -->

---

````md magic-move
```nix {*|9}
{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = {
    self,
    nixpkgs,
    ...
  }: {
    packages = {};

    nixosConfigurations = {};
  };
}
```
```nix {9-12}
{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = {
    self,
    nixpkgs,
    ...
  }: {
    packages.example = {
      nixpkgs.legacyPackages.x86_64-linux.callPackage ./example.nix {};
    };
  };
}
```
```nix {12}
{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = {
    self,
    nixpkgs,
    ...
  }: {
    packages = {};

    nixosConfigurations = {};
  };
}
```
```nix {9-12}
{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = {
    self,
    nixpkgs,
    ...
  }: {
    nixosConfigurations.example = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./example.nix
        {boot.isContainer=true;}
      ];
    };
  };
}
```
````

<!--
So just to run through the absolute basics, here we have a completely empty nix flake.

[click] With nix we can declaratively build pkgs

[click] Lets take a look at one, here we have  a example pkg for the x84 64 bit linux architecture. This is of course not the only hardware that can run pkgs though.

[click] Now i'll draw your attention to nixosConfigurations

[click] taking a more in-depth look, we can declare all sorts of details of our system.
-->

---

## Is it worth the cost?

<!--
I will be the first to admit, espessially from that last slide, that nix has a very steep learning curve but when you truly get it working it works like a charm
-->

---

## Wrapping up

<br>

<v-clicks>

- Use nix!
- https://github.com/isabelroses/talks
- And if you really don't want to give up docker, nix can build docker images

</v-clicks>

<!-- 
    [click]
    [click] the notes for this talk is located on the GitHub repo there, along with some additional resources, and maybe even build this talk???
    [click] any questions
-->
