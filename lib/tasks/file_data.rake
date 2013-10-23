namespace :db do
	desc "Fill database with file data"
	task populate: :environment do
		if ENV['update'].nil?
			DataFile.create!(
				"name" => "xmlsoccer-match-309393.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:31 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309390.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:31 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309392.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:31 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309391.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:31 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309394.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:31 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309389.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:31 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309395.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:31 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309397.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:31 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309398.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:31 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309399.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309400.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309405.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309402.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309401.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309403.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309404.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309406.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309407.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309408.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309409.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309410.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309411.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309412.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309414.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309413.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309415.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309416.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309418.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309419.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309420.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309421.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309423.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309424.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309422.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309425.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309426.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309428.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309429.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309430.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309427.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309431.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309432.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309433.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309434.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309436.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309435.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309438.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309439.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309440.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309441.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309442.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309437.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309447.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309443.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309444.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309445.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
			DataFile.create!(
				"name" => "xmlsoccer-match-309446.xml",
				"path" => "soccer/matches",
				"has_corrections" => "false",
				"format" => "xml",
				"data_store" => "aws",
				"data_store_id" => "1",
				"timestamp" => "Sun Oct 20 14:35:32 PDT 2013",
			)
		end
	end
end
