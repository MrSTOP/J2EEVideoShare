package yankunwei.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class FFMPEGTool {

    private static FFMPEGTool ffmpegTool;

    private final String ffmpegPath;

    private FFMPEGTool() throws IOException {
        Properties properties = new Properties();
        properties.load(FFMPEGTool.class.getResourceAsStream("/yankunwei/Config.properties"));
        ffmpegPath = properties.getProperty("FFmpegPath");
    }

    public static FFMPEGTool getInstance() {
        if (ffmpegTool == null) {
            try {
                ffmpegTool = new FFMPEGTool();
            } catch (IOException e) {
                throw new IllegalStateException("FFmpeg Tool Initialized failed");
            }
        }
        return ffmpegTool;
    }

    private String secondToHHmmss(int second) {
        return String.format("%02d:%02d:%02d", second / 3600, second / 60 % 60, second % 60);
    }

    private String getVideoTotalTime(String ffmpegPath, String videoPath) {
        List<String> args = new ArrayList<>();
        args.add(ffmpegPath);
        args.add("-i");
        args.add(videoPath);
        StringBuffer stringBuffer = new StringBuffer();
        try {
            ProcessBuilder processBuilder = new ProcessBuilder(args);
            final Process process = processBuilder.start();
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(process.getErrorStream()));
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                stringBuffer.append(line);
            }
            bufferedReader.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println(stringBuffer.toString());
        String ffmpegTimeReg = "Duration: (.*?), start: (.*?), bitrate: (\\d*) kb\\/s";
        Pattern ffmpegPattern = Pattern.compile(ffmpegTimeReg);
        Matcher matcher = ffmpegPattern.matcher(stringBuffer.toString());
        if (matcher.find()) {
            System.out.println("Duration: " + matcher.group(1));
            System.out.println("Start: " + matcher.group(2));
            System.out.println("BitRate: " + matcher.group(3));
        }
        ffmpegTimeToSecond(matcher.group(1));
        return matcher.group(1);
    }

    private int ffmpegTimeToSecond(String time) {
        String[] times = time.split(":|\\.");
        int second = 0;
        second += Integer.valueOf(times[0]) * 3600;
        second += Integer.valueOf(times[1]) * 60;
        second += Integer.valueOf(times[2]);
        System.out.println("SEC: " + second);
        return second;
    }

    public boolean screenImageRandom(String videoFilePath, String picturePath) {
        return screenImageRandom(ffmpegPath, videoFilePath, picturePath);
    }

    public boolean screenImageRandom(String ffmpegPath, String videoFilePath, String picturePath) {
        Random random = new Random();
        int totalTime = ffmpegTimeToSecond(getVideoTotalTime(ffmpegPath, videoFilePath));
        int pictureTime = random.nextInt(totalTime);
        String pictureTimeStr = secondToHHmmss(pictureTime);
        return screenImage(ffmpegPath, videoFilePath, picturePath, pictureTimeStr);
    }

    public boolean screenImage(String videoFilePath, String picturePath, String time) {
        return this.screenImage(ffmpegPath, videoFilePath, picturePath, time);
    }

    /**
     *
     * @param ffmpegPath    转码工具的存放路径
     * @param videoFilePath    要截图的视频源文件
     * @param picturePath	添加截取的图片的保存路径
     * @param time          截图时间
     * @return              截图是否成功
     */
    public boolean screenImage(String ffmpegPath, String videoFilePath, String picturePath, String time) {

        // 创建一个List集合来保存从视频中截取图片的命令
        List<String> cutpic = new ArrayList<String>();
        cutpic.add(ffmpegPath);
        cutpic.add("-ss"); // 添加参数＂-ss＂，该参数指定截取的起始时间
        cutpic.add(time); // 添加起始时间为第17秒
        cutpic.add("-i");
        cutpic.add(videoFilePath); // 要截图的视频源文件
        cutpic.add("-y");
        cutpic.add("-f");
        cutpic.add("image2");
        cutpic.add(picturePath); // 添加截取的图片的保存路径
        System.out.println(cutpic);
        ProcessBuilder builder = new ProcessBuilder();
        try {

            builder.command(cutpic);
            builder.redirectErrorStream(true);
            builder.start();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
