#!/bin/bash

hidutil property --set '{
  "UserKeyMapping": [
    {
      "HIDKeyboardModifierMappingSrc": 0x700000039,
      "HIDKeyboardModifierMappingDst": 0x700000068
    },
    {
      "HIDKeyboardModifierMappingSrc": 0x7000000E7,
      "HIDKeyboardModifierMappingDst": 0x7000000E0
    }
  ]
}'
