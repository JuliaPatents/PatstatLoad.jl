--
ALTER TABLE tls202_appln_title ADD FOREIGN KEY (appln_id) REFERENCES tls201_appln(appln_id);
--
ALTER TABLE tls203_appln_abstr ADD FOREIGN KEY (appln_id) REFERENCES tls201_appln(appln_id);
--
ALTER TABLE tls204_appln_prior ADD FOREIGN KEY (appln_id) REFERENCES tls201_appln(appln_id);
ALTER TABLE tls204_appln_prior ADD FOREIGN KEY (prior_appln_id) REFERENCES tls201_appln(appln_id);
--
ALTER TABLE tls205_tech_rel ADD FOREIGN KEY (appln_id) REFERENCES tls201_appln(appln_id);
ALTER TABLE tls205_tech_rel ADD FOREIGN KEY (tech_rel_appln_id) REFERENCES tls201_appln(appln_id);
--
ALTER TABLE tls207_pers_appln ADD FOREIGN KEY (appln_id) REFERENCES tls201_appln(appln_id);
ALTER TABLE tls207_pers_appln ADD FOREIGN KEY (person_id) REFERENCES tls206_person(person_id);
--
ALTER TABLE tls209_appln_ipc ADD FOREIGN KEY (appln_id) REFERENCES tls201_appln(appln_id);
--
ALTER TABLE tls210_appln_n_cls ADD FOREIGN KEY (appln_id) REFERENCES tls201_appln(appln_id);
--
ALTER TABLE tls211_pat_publn ADD FOREIGN KEY (appln_id) REFERENCES tls201_appln(appln_id);
--
ALTER TABLE tls212_citation ADD FOREIGN KEY (pat_publn_id) REFERENCES tls211_pat_publn(pat_publn_id);
ALTER TABLE tls212_citation ADD FOREIGN KEY (cited_pat_publn_id) REFERENCES tls211_pat_publn(pat_publn_id);
ALTER TABLE tls212_citation ADD FOREIGN KEY (cited_appln_id) REFERENCES tls201_appln(appln_id);
ALTER TABLE tls212_citation ADD FOREIGN KEY (cited_npl_publn_id) REFERENCES tls214_npl_publn(npl_publn_id);
--
ALTER TABLE tls215_citn_categ ADD FOREIGN KEY (pat_publn_id, citn_replenished, citn_id) REFERENCES tls212_citation(pat_publn_id, citn_replenished, citn_id);
--
ALTER TABLE tls216_appln_contn ADD FOREIGN KEY (appln_id) REFERENCES tls201_appln(appln_id);
ALTER TABLE tls216_appln_contn ADD FOREIGN KEY (parent_appln_id) REFERENCES tls201_appln(appln_id);
--
ALTER TABLE tls222_appln_jp_class ADD FOREIGN KEY (appln_id) REFERENCES tls201_appln(appln_id);
--
ALTER TABLE tls223_appln_docus ADD FOREIGN KEY (appln_id) REFERENCES tls201_appln(appln_id);
--
ALTER TABLE tls224_appln_cpc ADD FOREIGN KEY (appln_id) REFERENCES tls201_appln(appln_id);
--
ALTER TABLE tls225_docdb_fam_cpc ADD FOREIGN KEY (docdb_family_id) REFERENCES tls201_appln(docdb_family_id);
--
ALTER TABLE tls226_person_orig ADD FOREIGN KEY (person_id) REFERENCES tls206_person(person_id);
--
ALTER TABLE tls227_pers_publn ADD FOREIGN KEY (person_id) REFERENCES tls206_person(person_id);
ALTER TABLE tls227_pers_publn ADD FOREIGN KEY (pat_publn_id) REFERENCES tls211_pat_publn(pat_publn_id);
--
ALTER TABLE tls228_docdb_fam_citn ADD FOREIGN KEY (docdb_family_id) REFERENCES tls201_appln(docdb_family_id);
ALTER TABLE tls228_docdb_fam_citn ADD FOREIGN KEY (cited_docdb_family_id) REFERENCES tls201_appln(docdb_family_id);
--
ALTER TABLE tls229_appln_nace2 ADD FOREIGN KEY (appln_id) REFERENCES tls201_appln(appln_id);
ALTER TABLE tls229_appln_nace2 ADD FOREIGN KEY (nace2_code) REFERENCES tls902_ipc_nace2(nace2_code);
--
ALTER TABLE tls230_appln_techn_field ADD FOREIGN KEY (appln_id) REFERENCES tls201_appln(appln_id);
ALTER TABLE tls230_appln_techn_field ADD FOREIGN KEY (techn_field_nr) REFERENCES tls901_techn_field_ipc(techn_field_nr);
--
ALTER TABLE tls231_inpadoc_legal_event ADD FOREIGN KEY (appln_id) REFERENCES tls201_appln(appln_id);
ALTER TABLE tls231_inpadoc_legal_event ADD FOREIGN KEY (event_auth, event_code) REFERENCES tls803_legal_event_code(event_auth, event_code);
--
ALTER TABLE tls901_techn_field_ipc ADD FOREIGN KEY (techn_field_nr) REFERENCES tls209_appln_ipc(techn_field_nr);
--
ALTER TABLE tls904_nuts ADD FOREIGN KEY (nuts) REFERENCES tls206_person(nuts);
--