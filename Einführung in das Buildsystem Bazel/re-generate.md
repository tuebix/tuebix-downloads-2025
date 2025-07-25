Use the following script to recreate the file:

```sh
  git clone https://codeberg.org/obruns/tuebix-2025.git
  pushd tuebix-2025
  git reset --hard 28dc5bdd3d03f0406b25c317e4bc017d8e583a00
  ./scripts/create-slides.sh
  pushd slides

  ln --force --symbolic ../illustrations illustrations
  ln --force --symbolic ../plantuml plantuml

  cat >slides.css <<'EOF'
  <style>
  .slides {
      font-size: 0.25em;
  }
  .reveal ul {
      display: block;
  }
  .reveal ol {
      display: block;
  }

  img {
      max-height: 350px !important;
  }

  figcaption {
      font-size: 0.6em !important;
      font-style: italic !important;
  }

  .subtitle {
      font-style: italic !important;
  }

  .date {
      font-size: 0.75em !important;
  }
  </style>
  EOF

  pandoc --to=revealjs \
    --embed-resources \
    --standalone \
    --include-in-header=slides.css \
    --output=einfuehrung-in-das-buildsystem-bazel.html slides.md
```

The version of Pandoc used here is from the pandoc/minimal@a22f45e7aa99 container image.
