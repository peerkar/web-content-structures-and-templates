{
    "availableLanguageIds": [
        "en_US"
    ],
    "defaultLanguageId": "en_US",
    "fields": [
        {
            "label": {
                "en_US": "Change Interval (in seconds)"
            },
            "predefinedValue": {
                "en_US": ""
            },
            "style": {
                "en_US": ""
            },
            "tip": {
                "en_US": ""
            },
            "dataType": "integer",
            "fieldNamespace": "ddm",
            "indexType": "",
            "localizable": false,
            "name": "interval",
            "readOnly": false,
            "repeatable": false,
            "required": true,
            "showLabel": true,
            "type": "ddm-integer"
        },
        {
            "label": {
                "en_US": "Image Width"
            },
            "predefinedValue": {
                "en_US": "auto"
            },
            "style": {
                "en_US": ""
            },
            "tip": {
                "en_US": "Set a fixed value or 100% to scale the slider to the parent containers width."
            },
            "dataType": "string",
            "indexType": "keyword",
            "localizable": true,
            "name": "imageWidth",
            "readOnly": false,
            "repeatable": false,
            "required": false,
            "showLabel": true,
            "type": "text"
        },
        {
            "label": {
                "en_US": "Random Starting Slide"
            },
            "predefinedValue": {
                "en_US": false
            },
            "style": {
                "en_US": ""
            },
            "tip": {
                "en_US": ""
            },
            "dataType": "boolean",
            "indexType": "",
            "localizable": false,
            "name": "randomize",
            "readOnly": false,
            "repeatable": false,
            "required": false,
            "showLabel": true,
            "type": "checkbox"
        },
        {
            "label": {
                "en_US": "Title"
            },
            "predefinedValue": {
                "en_US": ""
            },
            "style": {
                "en_US": ""
            },
            "tip": {
                "en_US": ""
            },
            "dataType": "string",
            "indexType": "",
            "localizable": true,
            "name": "title",
            "readOnly": false,
            "repeatable": true,
            "required": true,
            "showLabel": true,
            "type": "text",
            "nestedFields": [
                {
                    "label": {
                        "en_US": "Text"
                    },
                    "predefinedValue": {
                        "en_US": ""
                    },
                    "style": {
                        "en_US": ""
                    },
                    "tip": {
                        "en_US": ""
                    },
                    "dataType": "html",
                    "fieldNamespace": "ddm",
                    "indexType": "",
                    "localizable": true,
                    "name": "text",
                    "readOnly": false,
                    "repeatable": false,
                    "required": false,
                    "showLabel": true,
                    "type": "ddm-text-html"
                },
                {
                    "label": {
                        "en_US": "Image"
                    },
                    "predefinedValue": {
                        "en_US": ""
                    },
                    "style": {
                        "en_US": ""
                    },
                    "tip": {
                        "en_US": ""
                    },
                    "dataType": "document-library",
                    "fieldNamespace": "ddm",
                    "indexType": "",
                    "localizable": false,
                    "name": "image",
                    "readOnly": false,
                    "repeatable": false,
                    "required": true,
                    "showLabel": true,
                    "type": "ddm-documentlibrary"
                },
                {
                    "label": {
                        "en_US": "Link"
                    },
                    "predefinedValue": {
                        "en_US": ""
                    },
                    "style": {
                        "en_US": ""
                    },
                    "tip": {
                        "en_US": ""
                    },
                    "dataType": "string",
                    "indexType": "",
                    "localizable": true,
                    "name": "link",
                    "readOnly": false,
                    "repeatable": false,
                    "required": true,
                    "showLabel": true,
                    "type": "text"
                },
                {
                    "label": {
                        "en_US": "Visible from"
                    },
                    "predefinedValue": {
                        "en_US": ""
                    },
                    "style": {
                        "en_US": ""
                    },
                    "tip": {
                        "en_US": ""
                    },
                    "dataType": "date",
                    "fieldNamespace": "ddm",
                    "indexType": "",
                    "localizable": false,
                    "name": "visibleFrom",
                    "readOnly": false,
                    "repeatable": false,
                    "required": true,
                    "showLabel": true,
                    "type": "ddm-date"
                },
                {
                    "label": {
                        "en_US": "Visible to"
                    },
                    "predefinedValue": {
                        "en_US": ""
                    },
                    "style": {
                        "en_US": ""
                    },
                    "tip": {
                        "en_US": ""
                    },
                    "dataType": "date",
                    "fieldNamespace": "ddm",
                    "indexType": "",
                    "localizable": false,
                    "name": "visibleTo",
                    "readOnly": false,
                    "repeatable": false,
                    "required": true,
                    "showLabel": true,
                    "type": "ddm-date"
                }
            ]
        }
    ]
}