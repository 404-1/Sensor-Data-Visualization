import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

file = r"sensor plot\sensordata.csv"
datafile = pd.read_csv(file)
strain = pd.DataFrame(datafile)


strain.sensor.astype('str')     # Convert sensor column to string
sens_og= strain['sensor'].str.split('!')      # split string to remove index after "!"
y = [value[0] for value in sens_og]       # Remove first half of divided x string
strain.loc[:, 'sensor'] = y     # Modify the sensor column view of the dataframe (ie changing the original dataframe)
strain.sensor = strain.sensor.astype('float')   # Convert sensor column from string to float

plt.figure()
strainPlot = sns.scatterplot(data=strain, x='x', y='y',
                             size='sensor', sizes=(10,50),
                             hue='sensor', palette='viridis',
                             hue_norm=(5,30), legend=False)
strainPlot.set(xlabel = 'Distance (m)',ylabel = 'Distance (m)', title='Strain (MPa) over Sensor Grid')

colBar = plt.colorbar(strainPlot.get_children()[0])
colBar.set_ticklabels(range(5,35,5))
colBar.set_label('MPa')

plt.grid(True)
plt.show()