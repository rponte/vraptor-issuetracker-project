package base;

import java.net.URL;

import javax.sql.DataSource;

import org.dbunit.database.DatabaseConfig;
import org.dbunit.database.DatabaseConnection;
import org.dbunit.database.IDatabaseConnection;
import org.dbunit.dataset.xml.FlatXmlDataSet;
import org.dbunit.dataset.xml.FlatXmlDataSetBuilder;
import org.dbunit.ext.postgresql.PostgresqlDataTypeFactory;
import org.dbunit.operation.DatabaseOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.springframework.stereotype.Component;

@Component
public class DatabaseHelper {
	
	public DataSource dataSource;

	@Autowired
	public DatabaseHelper(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public void cleanAndInsert(URL xml) {
		IDatabaseConnection dbconn;
		try {
			dbconn = new DatabaseConnection(DataSourceUtils.getConnection(dataSource));
			dbconn.getConfig().setProperty(DatabaseConfig.PROPERTY_DATATYPE_FACTORY, new PostgresqlDataTypeFactory());

			FlatXmlDataSet dataset = new FlatXmlDataSetBuilder().build(xml);
			DatabaseOperation.CLEAN_INSERT.execute(dbconn, dataset);

		} catch (Exception e) {
			throw new IllegalStateException(e);
		}
	}
	
}
