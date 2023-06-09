# Examples of some extensions features

Source script: `docs/extension_examples.md`

### Code Blocks colors

```yaml
...
markdown_extension.
    - pymdownx.superfences
```

```python
import numpy as np
```

### Admonitions

```yaml
...
theme:
    name: "material"
        - content.code.annotate
```

``` python
import numpy as np      # (1)
```

1. Numpy import

### Tabs

```yaml
...
markdown_extension.
    - pymdownx.tabbed:
        alternate_style: true   # Tabs
```

=== "Tab1"
    Content1
=== "Tab2"
    Content2

### Cards

```yaml
...
...
markdown_extension.
    - admonition
    - pymdownx.details
```

??? question "What's a card?"

    It can be folded

!!! question "What's a card?"

    It can be extended

!!! warning "What's a card?"

    It can have different colors
