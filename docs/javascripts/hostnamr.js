// hostnamr.js
//
// Client-side rewrite of the original Ruby/Sinatra backend (hostnamr_app.rb),
// porting the Hiragana and Solmisation name generators from hiragana.rb and
// solmisation.rb into the browser. The original app served these via a
// GET /generate endpoint rendered through views/hostnames.erb — this module
// replaces that entirely, with no server and no dependencies.
//
// The historic Ruby source is preserved in the repository for reference.

const Hostnamr = {

  schemas: {
    Hiragana: [
      'a',   'i',   'u',   'e',   'o',
      'ka',  'ki',  'ku',  'ke',  'ko',
      'sa',  'shi', 'su',  'se',  'so',
      'ta',  'chi', 'tsu', 'te',  'to',
      'na',  'ni',  'nu',  'ne',  'no',
      'ha',  'hi',  'hu',  'he',  'ho',
      'ma',  'mi',  'mu',  'me',  'mo',
      'ya',  'yu',  'yo',
      'ra',  'ri',  'ru',  're',  'ro',
      'wa',  'o',   'n'
    ],
    Solmisation: ['do', 're', 'mi', 'fa', 'so', 'la', 'si']
  },

  generate(schema, syllables, join, count) {
    const syllableSet = this.schemas[schema];
    const names = [];
    for (let i = 0; i < count; i++) {
      const parts = [];
      for (let j = 0; j < syllables; j++) {
        parts.push(syllableSet[Math.floor(Math.random() * syllableSet.length)]);
      }
      names.push(parts.join(join));
    }
    return names;
  },

  renderResults(names) {
    const items = names.map(n => `<li class="hostname">${n}</li>`).join('\n    ');
    return `<div id="hostnames" style="text-align: center">
  <ul class="hostnames">
    ${items}
  </ul>
</div>`;
  }

};
