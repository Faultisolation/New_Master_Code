package com.example.faultisolationv10;

import androidx.appcompat.app.AppCompatActivity;

import android.media.AudioFormat;
import android.media.AudioRecord;
import android.media.MediaRecorder;
import android.os.Bundle;
import android.os.Environment;
import android.view.View;
import android.widget.Button;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class MainActivity extends AppCompatActivity {
    private static final int RECODER_BPP=16;
    private static final String AUDIO_EX=".wav";
    private static final String AUDIO_TEMP="recrd_temp.raw";
    private static final int RECORDER_sAMPLE=44100;
    private static final String AUDIO_REC_FOL="AudioRecorder";
    private static final int RECODER_CHANNELS= AudioFormat.CHANNEL_IN_STEREO;
    private static final int RECODER_ENCODING=AudioFormat.ENCODING_PCM_16BIT;

    private AudioRecord recorder=null;
    private int bufferSize=0;
    private Thread recordingThread=null;
    private boolean inRecording=false;
    private boolean isRecording=false;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        setButtonHandlers();
        enableButtons(false);
        bufferSize=AudioRecord.getMinBufferSize(8000,AudioFormat.CHANNEL_CONFIGURATION_MONO,AudioFormat.ENCODING_PCM_16BIT);

    }


    private void setButtonHandlers() {

        (Button)findViewById(R.id.btnStart).setOnClickListener(btnClick);
        (Button)findViewById(R.id.btnStop).setOnClickListener(btnClick);

    }
    private void enableButtons(int id, boolean isEnable){
        ((Button)findViewById(id)).setEnabled(isEnable);

    }

    private void enableButtons(boolean isRecording){
        enableButtons(R.id.btnStart,!isRecording);
        enableButtons(R.id.btnStop,isRecording);

    }
    private String getFilename()
    {
        String filepath= Environment.getExternalStorageDirectory().getPath();
        File file = new File(filepath,AUDIO_REC_FOL);
        if(!file.exists()){
            file.mkdirs();
        }
        return (file.getAbsolutePath() + "/" + System.currentTimeMillis() + AUDIO_EX);
    }
    private String getTempFilename()
    {
        String filepath= Environment.getDownloadCacheDirectory().getPath();
        File file = new File(filepath,AUDIO_REC_FOL);
          if(!file.exists()){
              file.mkdirs();
          }
          File tempFile = new File(filepath,AUDIO_TEMP);
          if(tempFile.exists())
          {
              tempFile.delete();
          }
            return(file.getAbsolutePath() + "/" + AUDIO_TEMP);

          }
          private void startRecording() {
              recorder = new AudioRecord(MediaRecorder.AudioSource.MIC,
                      RECORDER_sAMPLE, RECODER_CHANNELS, RECODER_ENCODING, bufferSize);
              int i = recorder.getState();
              if (i == 1)
              {
                  recorder.startRecording();
              }
              isRecording=true;
              recordingThread=new Thread(new Runnable() {
                  @Override
                  public void run() {
                      writeAudioDatatoFile();

                  }
              },"AudioRecorder Thread");
              recordingThread.start();
          }
          private void  writeAudioDatatoFile()
          {
              byte data[]=new byte[bufferSize];
                String filename=getTempFilename();
              FileOutputStream os=null;
              try {
                  os=new FileOutputStream(filename);
              }catch (FileNotFoundException e) {
                  e.printStackTrace();

          }
              int read=0;
              if(null != os)
              {
                  while (isRecording)
                  {
                      read=recorder.read(data,0,bufferSize);
                      if (AudioRecord.ERROR_INVALID_OPERATION != read)
                      {
                          try {
                              os.write(data);
                          }catch (IOException e){
                              e.printStackTrace();
                          }
                      }
                  }
                  try {
                      os.close();
                  }catch (IOException e){
                      e.printStackTrace();
                  }
              }
          }
          private void stopRecording() {
              if (null != recorder) {
                  isRecording = false;
                  int i = recorder.getState();
                  if (i == 1) {
                      recorder.stop();
                  }
                  recorder.release();
                  recorder = null;
                  recordingThread = null;
              }
              copyWaveFile(getTempFilename(), getFilename());
              deteTempFile();
          }
          private void deteTempFile()
          {
              File file=new File(getTempFilename());
              file.delete();
          }
          private void copyWaveFile(String inFilename,String outFilename)
          {
              FileInputStream in =null;
              FileOutputStream out = null;
              long totalAudiolen=0;
              long totalDatalen=totalAudiolen+ 36;
              long longSamplerate= RECORDER_sAMPLE;
              int channels=2;
              long byteRate= RECODER_BPP+RECORDER_sAMPLE+channels/8;
              byte[] data=new byte[bufferSize];
              try {
                  in=new FileInputStream(inFilename);
                  out=new FileOutputStream(outFilename);
                  totalAudiolen=in.getChannel().size();
                  totalDatalen=totalAudiolen+36;
                  AppLog.logString("File Size:"+totalDatalen);
                  WriteWaveFileHeader(out,totalAudiolen,totalDatalen,longSamplerate,channels,byteRate);
                  while (in.read(data)!=-1)
                  {
                      out.write(data);
                  }
                  in.close();
                  out.close();


              }catch (FileNotFoundException e)
              {
                    e.printStackTrace();
              }catch (IOException e){
                  e.printStackTrace();
              }
          }
          private void WriteWaveFileHeader(
        FileOutputStream out,long totalAudiolen,long totalDatalen,long longSampleRate,int channels,long byteRate)throws IOException{
        byte[] header=new byte[44];
              header[0]='R';
              header[1]='I';
              header[2]='F';
              header[3]='F';
              header[4]=(byte)(totalDatalen & 0xff);
              header[5]=(byte)((totalDatalen >> 8)& 0xff);
              header[6]=(byte)((totalDatalen >> 16)& 0xff);
              header[7]=(byte)((totalDatalen >> 24)& 0xff);
              header[8]='W';
              header[9]='A';
              header[10]='V';
              header[11]='E';
              header[12]='f';
              header[13]='m';
              header[14]='t';
              header[15]=' ';
              header[16]=16;
              header[17]=0;
              header[18]=0;
              header[19]=0;
              header[20]=1;
              header[21]=0;
              header[22]=(byte) channels;
              header[23]=0;
              header[24]=(byte)(longSampleRate & 0xff);
              header[25]=(byte)((longSampleRate >> 8) & 0xff);
              header[26]=(byte)((longSampleRate >> 16) & 0xff);
              header[27]=(byte)((longSampleRate >> 24) & 0xff);
              header[28]=(byte)(byteRate & 0xff);
              header[29]=(byte)((byteRate >> 8) & 0xff);
              header[30]=(byte)((byteRate >> 16) & 0xff);
              header[31]=(byte)((byteRate >> 24) & 0xff);
              header[32]=(byte)(2 * 16 / 8);
              header[33]=0;
              header[34]=RECODER_BPP;
              header[35]=0;
              header[36]='d';
              header[37]='a';
              header[38]='t';
              header[39]='a';
              header[40]=(byte)(totalAudiolen & 0xff);
              header[41]=(byte)((totalAudiolen >> 8) & 0xff);
              header[42]=(byte)((totalAudiolen >> 16 ) & 0xff);
              header[43]=(byte)((totalAudiolen >> 24 ) & 0xff);
              out.write(header,0,44);


    }
    private View.OnClickListener btnClick =new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            switch (v.getId())
            {
                case R.id.btnStart:{
                    AppLog.logString("Start Recording");
                    enableButtons(true);
                    startRecording();
                    break;
                }
                case R.id.btnStop:{
                    AppLog.logString("Stop Recording");
                    startRecording();
                    break;
                }
            }
        }
    };



    }










