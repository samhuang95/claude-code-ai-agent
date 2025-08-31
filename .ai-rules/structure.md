---
title: Project Structure
description: "Defines the file organization, naming conventions, and development structure for the SQL Generator Chrome Extension."
inclusion: always
---

# Project Structure: SQL Code Generator Chrome Extension

## Directory Organization

```
SQL-generator/
├── .ai-rules/                    # AI development guidelines
├── src/                          # Source code
│   ├── background/               # Service worker scripts
│   │   └── service-worker.js     # Main background script
│   ├── content/                  # Content scripts (if needed)
│   │   └── content-script.js     # Page interaction scripts
│   ├── core/                     # SQL generation engine
│   │   ├── generators/           # SQL statement generators
│   │   │   ├── insert-generator.js
│   │   │   ├── update-generator.js
│   │   │   └── base-generator.js
│   │   ├── parsers/              # Data input parsers
│   │   │   ├── csv-parser.js
│   │   │   ├── json-parser.js
│   │   │   └── table-parser.js
│   │   ├── validators/           # Input validation
│   │   │   ├── data-validator.js
│   │   │   ├── sql-validator.js
│   │   │   └── schema-validator.js
│   │   └── formatters/           # SQL formatting utilities
│   │       ├── sql-formatter.js
│   │       └── dialect-adapter.js
│   ├── ui/                       # User interface components
│   │   ├── popup/                # Extension popup interface
│   │   │   ├── popup.html        # Main popup HTML
│   │   │   ├── popup.js          # Popup functionality
│   │   │   └── popup.css         # Popup styling
│   │   ├── options/              # Extension options page
│   │   │   ├── options.html      # Settings page HTML
│   │   │   ├── options.js        # Settings functionality
│   │   │   └── options.css       # Settings styling
│   │   ├── components/           # Reusable UI components
│   │   │   ├── data-table.js     # Interactive data table
│   │   │   ├── sql-preview.js    # SQL code preview component
│   │   │   ├── field-mapper.js   # Column mapping interface
│   │   │   └── export-manager.js # Export functionality
│   │   └── assets/               # Static assets
│   │       ├── icons/            # Extension icons
│   │       ├── styles/           # Global CSS
│   │       └── fonts/            # Custom fonts (if any)
│   ├── utils/                    # Utility functions
│   │   ├── storage.js            # Chrome storage wrapper
│   │   ├── clipboard.js          # Clipboard operations
│   │   ├── file-handler.js       # File import/export
│   │   └── logger.js             # Logging utilities
│   └── types/                    # Type definitions (if using TypeScript)
│       ├── sql-types.d.ts
│       └── extension-types.d.ts
├── dist/                         # Built extension files
├── tests/                        # Test files
│   ├── unit/                     # Unit tests
│   │   ├── generators/
│   │   ├── parsers/
│   │   └── validators/
│   ├── integration/              # Integration tests
│   └── fixtures/                 # Test data fixtures
├── docs/                         # Documentation
│   ├── api.md                    # API documentation
│   ├── user-guide.md            # User guide
│   └── development.md           # Development guide
├── config/                       # Configuration files
│   ├── webpack.config.js         # Build configuration
│   ├── jest.config.js           # Test configuration
│   └── eslint.config.js         # Linting configuration
├── manifest.json                 # Chrome extension manifest
├── package.json                  # Node.js dependencies
├── README.md                     # Project overview
└── .gitignore                    # Git ignore rules
```

## File Naming Conventions

### JavaScript Files
- **Components**: `kebab-case` (e.g., `data-table.js`, `sql-preview.js`)
- **Utilities**: `kebab-case` (e.g., `file-handler.js`, `storage.js`)
- **Classes**: `PascalCase` for class names, `kebab-case` for file names
- **Constants**: `UPPER_SNAKE_CASE` for constant values

### CSS Files
- **Global styles**: `kebab-case` (e.g., `global-styles.css`)
- **Component styles**: Match component name (e.g., `data-table.css`)
- **CSS classes**: `kebab-case` with BEM methodology where applicable

### HTML Files
- **Pages**: Descriptive names (e.g., `popup.html`, `options.html`)
- **IDs**: `camelCase` for JavaScript interaction
- **Classes**: `kebab-case` for CSS styling

## Code Organization Principles

### Module Structure
```javascript
// Standard module structure
export class SqlGenerator {
  constructor(options = {}) {
    // Initialize with options
  }
  
  generate(data, schema) {
    // Core functionality
  }
  
  validate(input) {
    // Validation logic
  }
}

// Export patterns
export { SqlGenerator };
export default SqlGenerator;
```

### Component Architecture
```javascript
// UI Component structure
class DataTableComponent {
  constructor(container, options) {
    this.container = container;
    this.options = { ...defaultOptions, ...options };
    this.init();
  }
  
  init() {
    this.render();
    this.bindEvents();
  }
  
  render() {
    // DOM manipulation
  }
  
  bindEvents() {
    // Event handling
  }
}
```

### Configuration Management
```javascript
// config/constants.js
export const SQL_DIALECTS = {
  MYSQL: 'mysql',
  POSTGRESQL: 'postgresql',
  SQLITE: 'sqlite'
};

export const DEFAULT_SETTINGS = {
  dialect: SQL_DIALECTS.MYSQL,
  batchSize: 1000,
  includeComments: true
};
```

## Development Guidelines

### New Feature Development
1. **Core Logic**: Implement in `src/core/` with appropriate subdirectory
2. **UI Components**: Create reusable components in `src/ui/components/`
3. **Tests**: Add corresponding tests in `tests/` matching source structure
4. **Documentation**: Update relevant docs in `docs/` directory

### File Creation Rules
- **Generators**: New SQL generators go in `src/core/generators/`
- **Parsers**: Input parsers belong in `src/core/parsers/`
- **UI Components**: Reusable components in `src/ui/components/`
- **Utilities**: Helper functions in `src/utils/`
- **Tests**: Mirror source structure in `tests/` directory

### Import/Export Standards
```javascript
// Prefer named exports for utilities
export { validateSqlSyntax, formatSqlCode };

// Use default exports for main classes
export default class SqlGenerator { }

// Barrel exports for related modules
// src/core/generators/index.js
export { InsertGenerator } from './insert-generator.js';
export { UpdateGenerator } from './update-generator.js';
```

### Asset Organization
- **Icons**: Multiple sizes in `src/ui/assets/icons/`
- **Styles**: Global styles in `src/ui/assets/styles/`
- **Static files**: Non-code assets in `src/ui/assets/`

## Build and Distribution

### Source vs. Distribution
- **Source**: All development files in `src/`
- **Built**: Compiled/bundled files in `dist/`
- **Packaging**: Chrome extension package from `dist/`

### Environment Configuration
- **Development**: Source files with hot reload
- **Testing**: Built files with source maps
- **Production**: Minified and optimized files

This structure supports scalable development while maintaining clear separation of concerns and following Chrome extension best practices.