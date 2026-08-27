---
display-name: "Adverse Outcome Pathways"

title: "The Adverse Outcome Pathway (AOP) Pathways"

description: "An Adverse Outcome Pathway describes how a stressor causes harm: a Molecular Initiating Event, then a chain of Key Events, ending in an Adverse Outcome. AOPs are written for regulatory decision making and are collected in the [AOP-Wiki](https://aopwiki.org/). The framing is deliberately simplified, which is what makes an AOP readable, and also what leaves it short of the molecular detail you need to analyse data against one. The pathways in this community add that layer back. A molecular AOP keeps the Key Events of the source AOP and attaches the molecular pathways behind them, so it can be used for enrichment analysis and data visualisation while still pointing back at the AOP it came from. The main use is in silico risk assessment, where the point is to need fewer animal studies. The concept and the first set of these pathways are described in [Martens et al. (2023), Molecular Adverse Outcome Pathways: towards the implementation of transcriptomics data in risk assessments](https://doi.org/10.1101/2023.03.02.530766). Most of the pathways here were drawn by hand. Newer ones are generated from Key Event to pathway mappings curated in the molAOP Builder and reviewed before deposit. This community page is featured in the [NAR Database Issue on WikiPathways](https://doi.org/10.1093/nar/gkaa1024)."

short-description: "The Adverse Outcome Pathway Community is created to highlight the molecular basis of Adverse Outcome Pathways."

reference: "[Martens M, et al. (2018) Introducing WikiPathways as a data-source to support Adverse Outcome Pathways for regulatory risk assessment of chemicals and nanomaterials. Front Genet](https://doi.org/10.3389/fgene.2018.00661)."

logo: "../assets/img/AOP_portal.png"

logo-link: "https://aopwiki.org/"

support: "This work has been funded by the European Food Safety Authority under the TXG-MAP project (GP/EFSA/ED/2022/01); by the European Union's Horizon 2020 research and innovation programme through [EU-ToxRisk](https://www.eu-toxrisk.eu/) under grant agreement [No. 681002](http://cordis.europa.eu/project/rcn/198787_en.html) and the EINFRA-22-2016 project [OpenRiskNet](https://openrisknet.org/) under grant agreement [No. 731075](http://cordis.europa.eu/project/rcn/206759_en.html); and by [VHP4Safety](https://vhp4safety.nl/) under NWA grant no. 1292.19.272."

contribute: "The list of pathways is not static and can be updated at any time. If you know of a pathway that should be added, please contact the administrator, Marvin Martens (marvin.martens[AT]maastrichtuniversity.nl), or add its identifier directly to [communities/AOP.txt](https://github.com/wikipathways/wikipathways-database/blob/main/communities/AOP.txt)."

community-tag: "AOP"

filterable: true

filter-placeholder: "Filter 99 molecular AOPs by title or WPID — e.g. steatosis, WP5648"

# Facets for the in-page filter. Organ comes from the four organ AOP networks
# the generated pathways were built from; the hand-curated ones predate those
# networks and carry no organ, which is why they are absent from the Organ facet.
facets:
- name: "Organ"
  values:
  - name: "Brain"
    wpids: ['WP5645', 'WP5650', 'WP5651', 'WP5652', 'WP5659', 'WP5674', 'WP5675', 'WP5684',
      'WP5685', 'WP5692', 'WP5694', 'WP5696', 'WP5701', 'WP5702', 'WP5707', 'WP5709',
      'WP5711', 'WP5713', 'WP5714', 'WP5715', 'WP5716', 'WP5717', 'WP5718', 'WP5719',
      'WP5720', 'WP5721', 'WP5722', 'WP5723', 'WP5724', 'WP5725', 'WP5726']
  - name: "Liver"
    wpids: ['WP5646', 'WP5647', 'WP5648', 'WP5649', 'WP5654', 'WP5655', 'WP5657', 'WP5658',
      'WP5660', 'WP5661', 'WP5662', 'WP5664', 'WP5665', 'WP5668', 'WP5671', 'WP5676',
      'WP5682', 'WP5683', 'WP5686', 'WP5697', 'WP5700', 'WP5727']
  - name: "Lungs"
    wpids: ['WP5656', 'WP5666', 'WP5673', 'WP5677', 'WP5680', 'WP5681', 'WP5687', 'WP5688',
      'WP5693', 'WP5695', 'WP5698', 'WP5699', 'WP5703', 'WP5705', 'WP5706', 'WP5712']
  - name: "Kidney"
    wpids: ['WP5653', 'WP5663', 'WP5667', 'WP5669', 'WP5670', 'WP5672', 'WP5678', 'WP5679',
      'WP5689', 'WP5690', 'WP5691', 'WP5704', 'WP5708', 'WP5710']
- name: "Source"
  values:
  - name: "Hand-curated"
    wpids: ['WP3980', 'WP4010', 'WP4914', 'WP4944', 'WP4945', 'WP5034', 'WP5035', 'WP5091',
      'WP5227', 'WP5228', 'WP5229', 'WP5389', 'WP5482', 'WP5517', 'WP5643', 'WP5644']
  - name: "Generated"
    wpids: ['WP5645', 'WP5646', 'WP5647', 'WP5648', 'WP5649', 'WP5650', 'WP5651', 'WP5652',
      'WP5653', 'WP5654', 'WP5655', 'WP5656', 'WP5657', 'WP5658', 'WP5659', 'WP5660',
      'WP5661', 'WP5662', 'WP5663', 'WP5664', 'WP5665', 'WP5666', 'WP5667', 'WP5668',
      'WP5669', 'WP5670', 'WP5671', 'WP5672', 'WP5673', 'WP5674', 'WP5675', 'WP5676',
      'WP5677', 'WP5678', 'WP5679', 'WP5680', 'WP5681', 'WP5682', 'WP5683', 'WP5684',
      'WP5685', 'WP5686', 'WP5687', 'WP5688', 'WP5689', 'WP5690', 'WP5691', 'WP5692',
      'WP5693', 'WP5694', 'WP5695', 'WP5696', 'WP5697', 'WP5698', 'WP5699', 'WP5700',
      'WP5701', 'WP5702', 'WP5703', 'WP5704', 'WP5705', 'WP5706', 'WP5707', 'WP5708',
      'WP5709', 'WP5710', 'WP5711', 'WP5712', 'WP5713', 'WP5714', 'WP5715', 'WP5716',
      'WP5717', 'WP5718', 'WP5719', 'WP5720', 'WP5721', 'WP5722', 'WP5723', 'WP5724',
      'WP5725', 'WP5726', 'WP5727']

editors:
- Marvin M2
- SidraAdil

redirect_from:
  - /index.php/Portal:AOP
curationui: true
---
