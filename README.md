# Ali Kaan Türkmen — Portfolio Website

A responsive, single-page portfolio for a Senior Software Engineer specialising in Embedded Systems, Backend Development, and DevOps.

## Technologies

- HTML5, CSS3 (CSS variables, Grid, Flexbox), Vanilla JavaScript (ES6+)
- Google Fonts (Inter) — only external dependency
- nginx:alpine (Docker) for serving
- nginx-proxy + Let's Encrypt ACME companion for production TLS

## Project Structure

```
alikaan.me/
├── index.html              # All content and markup
├── styles.css              # All styles (CSS variables in :root for theming)
├── script.js               # Scroll animations, nav, mobile menu, interactions
├── profile.jpg             # Profile photo
├── favicon.svg             # Site favicon
├── Dockerfile              # nginx:alpine image
├── docker-compose.yml      # Dev config (port 8080)
├── docker-compose.prod.yml # Prod config (nginx-proxy + TLS)
├── build.sh                # Builds Docker image
└── deploy.sh               # Pulls, builds, and restarts containers
```

## Getting Started

**Without Docker:**

```bash
python -m http.server 8000
# or
npx serve
```

**With Docker (dev):**

```bash
./build.sh
./deploy.sh        # serves on http://localhost:8080
```

**Production deployment:**

```bash
./deploy.sh prod   # serves on port 80/443 with auto TLS for alikaan.me
```

**Stop containers:**

```bash
./deploy.sh down
./deploy.sh prod down
```

## Customisation

- Content: edit `index.html`
- Colors / design tokens: change CSS variables in the `:root` block in `styles.css`
- New static assets: add `COPY` instructions in `Dockerfile`

## Contact

- Email: [turkmenalikaan@gmail.com](mailto:turkmenalikaan@gmail.com)
- LinkedIn: [linkedin.com/in/alikaanturkmen](https://linkedin.com/in/alikaanturkmen)
- GitHub: [github.com/alikaan](https://github.com/alikaan)
- Medium: [medium.com/@alikaanturkmen](https://medium.com/@alikaanturkmen)
