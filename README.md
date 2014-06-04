# This project is a work in progress.

# Cloudstack-Cookbook

The aim of this project is ti supply a fully functional devcloud (cloudstack sandbox) environment using multiple recipes.

## Supported Platforms

TODO: List your supported platforms.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['cloudstack']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### cloudstack::default

Include `cloudstack` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[cloudstack::default]"
  ]
}
```

## License and Authors

Author:: Ian Duffy (duffy@apache.org)
