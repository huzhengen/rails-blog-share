# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
date17 = '8月17日'
date18 = '8月18日'
times = [
  { time: '09:00 ~ 09:15', a: '', b: '', c: '', d: '' },
  { time: '09:15 ~ 09:30', a: '', b: '', c: '', d: '' },
  { time: '09:30 ~ 09:45', a: '', b: '', c: '', d: '' },
  { time: '09:45 ~ 10:00', a: '', b: '', c: '', d: '' },
  { time: '10:00 ~ 10:15', a: '', b: '', c: '', d: '' },
  { time: '10:15 ~ 10:30', a: '', b: '', c: '', d: '' },
  { time: '10:30 ~ 10:45', a: '', b: '', c: '', d: '' },
  { time: '10:45 ~ 11:00', a: '', b: '', c: '', d: '' },
  { time: '11:00 ~ 11:15', a: '', b: '', c: '', d: '' },
  { time: '11:15 ~ 11:30', a: '', b: '', c: '', d: '' },
  { time: '11:30 ~ 11:45', a: '', b: '', c: '', d: '' },
  { time: '11:45 ~ 12:00', a: '', b: '', c: '', d: '' },
  { time: '12:00 ~ 12:15', a: '', b: '', c: '', d: '' },
  { time: '12:15 ~ 12:30', a: '', b: '', c: '', d: '' },
  { time: '12:30 ~ 12:45', a: '', b: '', c: '', d: '' },
  { time: '12:45 ~ 13:00', a: '', b: '', c: '', d: '' },
  { time: '13:00 ~ 13:15', a: '', b: '', c: '', d: '' },
  { time: '13:15 ~ 13:30', a: '', b: '', c: '', d: '' },
  { time: '13:30 ~ 13:45', a: '', b: '', c: '', d: '' },
  { time: '13:45 ~ 14:00', a: '', b: '', c: '', d: '' },
  { time: '14:00 ~ 14:15', a: '', b: '', c: '', d: '' },
  { time: '14:15 ~ 14:30', a: '', b: '', c: '', d: '' },
  { time: '14:30 ~ 14:45', a: '', b: '', c: '', d: '' },
  { time: '14:45 ~ 15:00', a: '', b: '', c: '', d: '' },
  { time: '15:00 ~ 15:15', a: '', b: '', c: '', d: '' },
  { time: '15:15 ~ 15:30', a: '', b: '', c: '', d: '' },
  { time: '15:30 ~ 15:45', a: '', b: '', c: '', d: '' },
  { time: '15:45 ~ 16:00', a: '', b: '', c: '', d: '' },
  { time: '16:00 ~ 16:15', a: '', b: '', c: '', d: '' },
  { time: '16:15 ~ 16:30', a: '', b: '', c: '', d: '' },
  { time: '16:30 ~ 16:45', a: '', b: '', c: '', d: '' },
  { time: '16:45 ~ 17:00', a: '', b: '', c: '', d: '' },
]
times.each do |time|
  Event.create({status_a: time[:a], status_b: time[:b], status_c: time[:c], status_d: time[:d], date: date17, time: time[:time]})
end
times.each do |time|
  Event.create({status_a: time[:a], status_b: time[:b], status_c: time[:c], status_d: time[:d], date: date18, time: time[:time]})
end
