# frozen_string_literal: true

module EpathwayScraper
  # The settings to scrape each different authority
  AUTHORITIES = {
    central_coast_wyong_shire: {
      url: "https://eservices.centralcoast.nsw.gov.au/ePathway/Production",
      state: "NSW",
      lists: [:advertising]
    },
    ballarat: {
      url: "https://eservices.ballarat.vic.gov.au/ePathway/Production",
      state: "VIC",
      lists: [:advertising]
    },
    bendigo: {
      url: "https://epathway.bendigo.vic.gov.au/ePathway/Production",
      state: "VIC",
      # Not using :last_30_days because the bendigo server has a problem
      lists: [:advertising]
    },
    campbelltown: {
      url: "https://ebiz.campbelltown.nsw.gov.au/ePathway/Production",
      state: "NSW",
      lists: [:all]
    },
    darebin: {
      url: "https://eservices.darebin.vic.gov.au/ePathway/Production",
      state: "VIC",
      lists: [:all_this_year]
    },
    east_gippsland: {
      url: "https://epathway.egipps.vic.gov.au/ePathway/Production",
      state: "VIC",
      lists: [:last_30_days],
      # Looks like it's blocking requests from outside Australia
      australian_proxy: true
    },
    frankston: {
      url: "https://epathway.frankston.vic.gov.au/ePathway/Production",
      state: "VIC",
      lists: [:last_30_days]
    },
    gladstone: {
      url: "https://online.gladstone.qld.gov.au/ePathway/eProd",
      state: "QLD",
      lists: [:last_30_days]
    },
    glen_eira: {
      url: "https://epathway-web.gleneira.vic.gov.au/ePathway/Production",
      state: "VIC",
      lists: [:all],
      max_pages: 4
    },
    gold_coast: {
      url: "https://cogc.cloud.infor.com/ePathway/epthprod",
      state: "QLD",
      lists: [:last_30_days]
    },
    greater_shepparton: {
      url: "https://eservices.greatershepparton.com.au/ePathway/Production",
      state: "VIC",
      lists: [:last_30_days],
      # Has an incomplete SSL chain: See
      # https://www.ssllabs.com/ssltest/analyze.html?d=eservices.greatershepparton.com.au&latest
      disable_ssl_certificate_check: true
    },
    inverell: {
      url: "http://203.49.140.77/ePathway/Production",
      state: "NSW",
      lists: [:all_this_year]
    },
    ipswich: {
      url: "https://epathway.ipswich.qld.gov.au/ePathway/Production/",
      state: "QLD",
      lists: [:last_30_days]
    },
    kingston: {
      url: "https://online.kingston.vic.gov.au/ePathway/Production",
      state: "VIC",
      lists: [:all_this_year]
    },
    knox: {
      url: "https://eservices.knox.vic.gov.au/ePathway/Production",
      state: "VIC",
      lists: [:advertising]
    },
    lake_macquarie: {
      url: "https://property.lakemac.com.au/ePathway/Production",
      state: "NSW",
      lists: [:last_30_days]
    },
    latrobe: {
      url: "https://eservices.latrobe.vic.gov.au/ePathway/Production",
      state: "VIC",
      lists: [:last_30_days]
    },
    livingstone: {
      url: "http://mpathway.livingstone.qld.gov.au/ePathway/Production",
      state: "QLD",
      lists: [:last_30_days]
    },
    macedon_ranges: {
      url: "https://eservices.mrsc.vic.gov.au/ePathway/Production",
      state: "VIC",
      lists: [:last_30_days]
    },
    maroondah: {
      url: "https://eservices.maroondah.vic.gov.au/ePathway/Production",
      state: "VIC",
      lists: [:advertising]
    },
    monash: {
      url: "https://epathway.monash.vic.gov.au/ePathway/ePTHPROD",
      state: "VIC",
      lists: [:advertising]
    },
    mooney_valley: {
      url: "https://online.mvcc.vic.gov.au/ePathway/Production",
      state: "VIC",
      lists: [:advertising]
    },
    moreland: {
      url: "https://eservices.moreland.vic.gov.au/ePathway/Production",
      state: "VIC",
      lists: [:advertising]
    },
    nillumbik: {
      url: "https://epathway.nillumbik.vic.gov.au/ePathway/Production",
      state: "VIC",
      lists: [:advertising],
      australian_proxy: true
    },
    parramatta: {
      url: "https://onlineservices.cityofparramatta.nsw.gov.au/ePathway/Prod",
      state: "NSW",
      lists: %i[last_30_days other_applications]
    },
    port_phillip: {
      url: "https://eservices.portphillip.vic.gov.au/ePathway/Production",
      state: "VIC",
      lists: [:last_30_days]
    },
    rockhampton: {
      url: "https://eservices.rockhamptonregion.qld.gov.au/ePathway/ePathProd",
      state: "QLD",
      lists: [:last_30_days]
    },
    south_gippsland: {
      url: "https://eservices.southgippsland.vic.gov.au/ePathway/ePathProd",
      state: "VIC",
      lists: [:advertising]
    },
    the_hills: {
      url: "https://epathway.thehills.nsw.gov.au/ePathway/Production",
      state: "NSW",
      lists: [:last_30_days]
    },
    whitehorse: {
      url: "https://eservices.whitehorse.vic.gov.au/ePathway/Production",
      state: "VIC",
      lists: [:last_30_days]
    },
    wollongong: {
      url: "http://epathway.wollongong.nsw.gov.au/ePathway/Production",
      state: "NSW",
      lists: [:advertising]
    },
    yarra_ranges: {
      url: "https://epathway.yarraranges.vic.gov.au/ePathway/Production",
      state: "VIC",
      lists: [:all],
      max_pages: 20
    }
  }.freeze
end
