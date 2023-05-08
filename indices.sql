CREATE INDEX ON tls201_appln (appln_filing_date);
CREATE INDEX ON tls201_appln (appln_filing_year);
CREATE INDEX ON tls201_appln (appln_auth, appln_nr, appln_kind);
CREATE INDEX ON tls201_appln (granted);
CREATE INDEX ON tls201_appln (docdb_family_id);
CREATE INDEX ON tls201_appln (inpadoc_family_id);
--
CREATE INDEX ON tls204_appln_prior (appln_id);
CREATE INDEX ON tls204_appln_prior (prior_appln_id);
--
CREATE INDEX ON tls205_tech_rel (appln_id);
--
CREATE INDEX ON tls206_person (person_ctry_code);
--
CREATE INDEX ON tls207_pers_appln (appln_id);
CREATE INDEX ON tls207_pers_appln (person_id);
--
CREATE INDEX ON tls209_appln_ipc (appln_id);
CREATE INDEX ON tls209_appln_ipc (ipc_class_symbol);
--
CREATE INDEX ON tls211_pat_publn (publn_auth, publn_nr, publn_kind);
CREATE INDEX ON tls211_pat_publn (appln_id);
CREATE INDEX ON tls211_pat_publn (publn_date);
--
CREATE INDEX ON tls212_citation (pat_publn_id);
CREATE INDEX ON tls212_citation (citn_id);
CREATE INDEX ON tls212_citation (cited_appln_id, pat_publn_id);
CREATE INDEX ON tls212_citation (cited_pat_publn_id);
CREATE INDEX ON tls212_citation (cited_npl_publn_id);
CREATE INDEX ON tls212_citation (cited_appln_id);
--
CREATE INDEX ON tls214_npl_publn (npl_type);
--
CREATE INDEX ON tls215_citn_categ (pat_publn_id);
CREATE INDEX ON tls215_citn_categ (citn_id);
CREATE INDEX ON tls215_citn_categ (citn_categ);
--
CREATE INDEX ON tls216_appln_contn (appln_id);
CREATE INDEX ON tls216_appln_contn (parent_appln_id);
--
CREATE INDEX ON tls222_appln_jp_class (appln_id);
CREATE INDEX ON tls222_appln_jp_class (jp_class_scheme);
CREATE INDEX ON tls222_appln_jp_class (jp_class_symbol);
--
CREATE INDEX ON tls223_appln_docus (appln_id);
CREATE INDEX ON tls223_appln_docus (docus_class_symbol);
--
CREATE INDEX ON tls224_appln_cpc (appln_id);
CREATE INDEX ON tls224_appln_cpc (cpc_class_symbol);
CREATE INDEX ON tls224_appln_cpc (cpc_scheme);
--
CREATE INDEX ON tls226_person_orig (person_id);
--
CREATE INDEX ON tls227_pers_publn (pat_publn_id);
CREATE INDEX ON tls227_pers_publn (person_id);
CREATE INDEX ON tls227_pers_publn (applt_seq_nr);
CREATE INDEX ON tls227_pers_publn (invt_seq_nr);
--
CREATE INDEX ON tls228_docdb_fam_citn (docdb_family_id);
CREATE INDEX ON tls228_docdb_fam_citn (cited_docdb_family_id);
--
CREATE INDEX ON tls229_appln_nace2 (appln_id);
CREATE INDEX ON tls229_appln_nace2 (nace2_code);
--
CREATE INDEX ON tls230_appln_techn_field (appln_id);
CREATE INDEX ON tls230_appln_techn_field (techn_field_nr);
--
CREATE INDEX ON tls231_inpadoc_legal_event (appln_id);
CREATE INDEX ON tls231_inpadoc_legal_event (appln_id, event_seq_nr);
--
CREATE INDEX ON tls801_country (ctry_code);
--
CREATE INDEX ON tls901_techn_field_ipc (techn_field_nr);
--
CREATE INDEX ON tls902_ipc_nace2 (ipc);
CREATE INDEX ON tls902_ipc_nace2 (not_with_ipc);
CREATE INDEX ON tls902_ipc_nace2 (unless_with_ipc);
CREATE INDEX ON tls902_ipc_nace2 (nace2_code);