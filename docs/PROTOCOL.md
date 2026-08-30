# CPE/1 protocol

The Node bridge validates typed JSON and converts it to a single numeric line. Python parses that line and performs one known engine operation.

```text
CPE/1 sequence opcode number number ...
```

Supported actions include spawning boxes, circles, and polygons; changing gravity; applying impulses or forces; emitting particle bursts; clearing the scene; and pausing or resuming.

Example JSON:

```json
{
  "action": "spawn",
  "shape": "polygon",
  "x": 420,
  "y": 90,
  "sides": 6,
  "size": 30,
  "mass": 1,
  "color": [222, 108, 39]
}
```

Equivalent numeric command:

```text
CPE/1 1 3 420 90 6 30 1 222 108 39
```

Limits are enforced for command length, finite numbers, coordinates, body size, mass, polygon sides, colors, particle count, force, and impulse. Unknown actions and source-code fields are rejected.
