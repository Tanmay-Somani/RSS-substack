# RSS-substack
Testing out deployment via different framework by converting python to javascript and vice versa in a substack RSS
=======
# Substack RSS → Pretty HTML (Plus)
**Features**
- Theme toggle (dark/light) with `localStorage` persistence
- Back button & sticky toolbar
- Export: **Download as PDF** (ReportLab) and **Download as DOCX** (python-docx)
- Smart input: enter a **Substack name** (e.g., `writebuildscale`) or a full URL; app normalizes to `/feed`
- XSLT-powered rendering of titles, descriptions, images, and full `content:encoded`

## Run
```bash
python -m venv .venv
# Windows: .venv\Scripts\activate
# macOS/Linux: source .venv/bin/activate
pip install -r requirements.txt
python app.py
# Open http://localhost:5000
```


The Website is accesible here: https://rss-substack-production.up.railway.app/
