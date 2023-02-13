import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class DataSet {

    ArrayList<String> date = new ArrayList<>();
    ArrayList<String> news = new ArrayList<>();

    void call(){
        String fileName = "dataset.csv";
        String line = "";

        try{
            BufferedReader br = new BufferedReader(new FileReader(fileName));

            while((line = br.readLine()) != null){
                String[] values = line.split(",");

                date.add(values[0]);
                news.add(values[1]);
            }

        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
