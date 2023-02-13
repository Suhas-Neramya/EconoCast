import java.io.*;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) throws IOException {
        DataSet data = new DataSet();
        data.call();

        Increase increase = new Increase();
        increase.call();

        ArrayList<String> date = new ArrayList<>();
        ArrayList<String> news = new ArrayList<>();
        ArrayList<String> inc = new ArrayList<>();



        FileWriter writer = new FileWriter("suhas.csv");
        writer.append("Date");
        writer.append(",");
        writer.append("News");
        writer.append(",");
        writer.append("Prediction");
        writer.append("\n");

        for(int i=0; i < increase.date.size(); i++){
            for(int j=0; j < data.date.size(); j++){
                if(increase.date.get(i).equals(data.date.get(j))){
                    date.add(data.date.get(j));
                    news.add(data.news.get(j));
                    inc.add(increase.increase.get(i));
                }
            }
        }

        for(int i=0; i < news.size(); i++){
            writer.append(date.get(i));
            writer.append(", ");
            writer.append(news.get(i));
            writer.append(", ");
            writer.append(inc.get(i));
            writer.append("\n");
        }
        writer.flush();
        writer.close();
    }
}