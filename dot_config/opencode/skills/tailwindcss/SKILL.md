---
name: tailwindcss
description: Supplemental instructions to using tailwindcss
license: MIT
compatibility: opencode
metadata:
  category: frontend
  frameworks: react,vue,html
  version: 1.0
---

## Common Issues Troubleshooting

### Issue 1: Styles not applying / Classes not working

**Symptoms**: Tailwind classes in HTML/JSX but no styles appear in browser

**Diagnosis**:

1. Check if CSS file is imported: `import './index.css'` or `<link href="styles.css">`
2. Inspect element in DevTools - if class name appears but no styles, it's a build issue
3. Check browser console for CSS loading errors
4. Verify Tailwind directives exist in CSS: `@tailwind base; @tailwind components; @tailwind utilities;`

**Note**: Step 4 applies only to tailwindcss version 3. For version 4, we're looking for `@import "tailwindcss";`

**Solutions**:

- Run build process: `npm run build` or ensure dev server is running
- Check `tailwind.config.js` content paths include your files:
  ```js
  content: ["./src/**/*.{js,jsx,ts,tsx}", "./public/index.html"];
  ```
- Restart dev server after config changes
- If using CDN (not recommended for production), verify script tag is correct
- Clear browser cache and rebuild
