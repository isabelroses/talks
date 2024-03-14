---
bg: "[[bg.svg]]"
---
 
## Reproducibility

-- Isabel --

NOTE: (press S for speaker view) Introduce myself > I think one of the biggest issues we ever get told is _swap slide_

---
<!-- .slide: data-auto-animate -->

![[it_works_on_my_machine.png]]

NOTE: but i refuse to believe that this is the only possible answer, so I looked onwards. asking myself _swap slides_

---
<!-- .slide: data-auto-animate -->

So whats the solution?

NOTE: well most people might try to push you towards containerisation

---

![[docker.png]]

NOTE: and if you did give in you will find this pretty looking guy. And I did try that myself at one point _swap slides_

---

![[docker_image.png]]

NOTE: So i gave it a shot, i containerised my website, which you can still find on docker hub to this day, but it still was not a flawless out come _swap slides_

---

![[devops.png]]

NOTE: there was still a chance of hitting some kind of obscure error, this picture pretty much sums it, But that lead me to asking the question once again _swap slides_

---
<!-- .slide: data-auto-animate -->

So whats the solution?

NOTE: at this point i was introduced to something called nix and thus NixOS, a fully declarative and reproducible environment

---

## Nix

NOTE: if you have been paying a lot of attention you might've noticed the background image (which i made), is the nix logo,

---

So what did this actually change?

---
<!-- .slide: data-auto-animate -->

- My neovim config

---
<!-- .slide: data-auto-animate -->

- My neovim config
- My website
---
<!-- .slide: data-auto-animate -->

- My neovim config
- My website
- My system configurations (even my mac)

NOTE: these are all examples of things that I was now able to make completely reproducible and build declaratively.

---

Is it worth the cost?

NOTE: I will be the first to admit that nix has a very steep learning curve but when you truly get it working it works like a charm

---
## Wrapping up

---
<!-- .slide: data-auto-animate -->

- Use nix!

---
<!-- .slide: data-auto-animate -->

- Use nix!
- https://github.com/isabelroses/talks

NOTE: the notes for this talk is located on the github repo there, along with some additional resources 


---
<!-- .slide: data-auto-animate -->

- Use nix!
- https://github.com/isabelroses/talks
- And if you really don't want to give up docker, nix can build docker images

NOTE: any questions