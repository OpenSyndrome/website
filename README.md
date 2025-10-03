# Open Syndrome Initiative website

[![Netlify Status](https://api.netlify.com/api/v1/badges/e1bd7ae8-1a2c-43b7-a4ae-a581e8b0b95d/deploy-status)](https://app.netlify.com/projects/opensyndrome/deploys)

In this repository only the code related to the website.
For definitions and guidelines access our organization profile.

## Development

To run this website locally, you will need Go installed.
Then [Hugo](https://gohugo.io/) **version 0.145.0 extended**. Once you have both run:

```
hugo server
```

### Theme

This website uses [Congo](https://jpanther.github.io/congo/docs/getting-started/)
theme. Please refer to its documentation when making changes to the frontend.

How to update the theme:

```bash
hugo mod get -u
```

## Citing & Authors

If you find this repository helpful, feel free to cite our publication: The Open Syndrome Definition

```
@misc{ferreira2025opensyndromedefinition,
      title={The Open Syndrome Definition}, 
      author={Ana Paula Gomes Ferreira and Aleksandar Anžel and Izabel Oliva Marcilio de Souza and Helen Hughes and Alex J Elliot and Jude Dzevela Kong and Madlen Schranz and Alexander Ullrich and Georges Hattab},
      year={2025},
      eprint={2509.25434},
      archivePrefix={arXiv},
      primaryClass={cs.AI},
      url={https://arxiv.org/abs/2509.25434}, 
}
```
