---
layout: intro
class: text-left
title: Reproducibility
defaults:
    style: 'background-image: linear-gradient(rgba(0, 0, 0, 0.333), rgba(0, 0, 0, 0.533)), url("/bg.svg"); background-repeat: no-repeat; background-position: center center; background-size: cover;'
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

<!-- at this point i was introduced to something called nix and thus NixOS, a fully declarative and reproducible environment -->

---

## Nix

<!-- if you have been paying a lot of attention you might've noticed the background image (which I made), is the nix logo, -->

---

<div class="item-center">

## So what did this actually change?

<br>

<v-clicks fade-out class="text-left">

- My neovim config
- My website
- My system configurations (even my Mac)

</v-clicks>

</div>

<!-- these are all examples of things that I was now able to make completely reproducible and build declaratively. -->

---

## Is it worth the cost?

<!-- I will be the first to admit that nix has a very steep learning curve but when you truly get it working it works like a charm -->

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
    [click] the notes for this talk is located on the GitHub repo there, along with some additional resources
    [click]
    [click] any questions
-->
