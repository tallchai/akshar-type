const cjcts = [
  'c_ca-deva',
  'c_cha-deva',
  'c_ch_va-deva',
  'ch_ya-deva',
  'ch_va-deva',
  'd_da-deva',
  'd_dha-deva',
  'd_dh_ya-deva',
  'd_va-deva',
  'd_ya-deva',
  'd_v_ya-deva',
  'g_rakar_ya-deva',
  'h_ma-deva',
  'h_ya-deva',
  'k_ta-deva',
  'k_sa-deva',
  'ph_sa-deva',
  'p_ja-deva',
  'p_za-deva',
  'sh_va-deva',
  'tt_tta-deva',
  'tt_ttha-deva',
  'tt_ya-deva',
  'tt_ra_uuMatra-deva',
  'tt_tt_ya-deva',
  'tta_ra_uuMatra-deva',
  'v_ya-deva'
];

function toLookup() {
  let output = 'lookup cjct_devanagari {';
  cjcts.forEach(c => {
    let cjctOutput = 'sub';
    const halfForms = c.split('-deva')[0]?.split('_');
    halfForms.forEach(h => {
      cjctOutput = `${cjctOutput} ${h}-deva`;
    });
    cjctOutput = `${cjctOutput} by ${c}`;
    output = `${output} \n \t${cjctOutput};`;
  });
  output = `${output} \n} cjct_devanagari;`;
  console.log(output);
};
