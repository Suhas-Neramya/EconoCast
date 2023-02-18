import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class DataSet {

    ArrayList<String> date = new ArrayList<>();
    ArrayList<String> news = new ArrayList<>();

    void call(){
        String fileName = "finalizedDataSet2.csv";
        String line = "";

        try{
            BufferedReader br = new BufferedReader(new FileReader(fileName));

            int i=0;

            while((line = br.readLine()) != null){
                String[] values = line.split(",");
                System.out.println(i++);

                date.add(values[0]);
                news.add(values[1].toLowerCase().replaceAll("\\p{Punct}", ""));
            }

        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
